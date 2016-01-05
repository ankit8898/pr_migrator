module PrMigrator
  class Export

    attr_accessor :client, :repo_name, :pr_numbers, :folder_name_for_exported_files

    def initialize(options = {})
      @client                         = Octokit::Client.new(access_token: PrMigrator.configuration.source_access_token)
      @repo_name                      = options[:repo_name]
      @pr_numbers                     = options[:pr_numbers]
      @folder_name_for_exported_files = "export_#{SecureRandom.urlsafe_base64(5)}"
      @failed_prs                     = []
    end

    # Start the process of exporting
    # The exported files will be json files
    def start
      Parallel.map(@pr_numbers, in_processes: 10 ) do |pr_number|
        begin
          response = @client.pull_request(@repo_name, pr_number)
          Dir.mkdir(File.join(Dir.getwd, @folder_name_for_exported_files))
          File.open("#{@folder_name_for_exported_files}/pr-#{pr_number}.json","w") do |f|
            f.write(JSON.pretty_generate(response.to_attrs))
          end
          puts "Exported: #{pr_number}"
        rescue Exception => e
          @failed_prs << pr_number
        end
        sleep 2
      end
      puts "The PR's Not exported were :#{@failed_prs}"
    end
  end
end
