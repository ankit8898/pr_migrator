module PrMigrator
  class Create

    attr_accessor :client
    attr_accessor :repo_name
    attr_accessor :exported_pr_dir
    attr_accessor :migration_branch

    def initialize(options = {})
      initialize_api_endpoint
      @client           = Octokit::Client.new(access_token: PrMigrator.configuration.destination_access_token)
      @repo_name        = options[:repo_name]
      @exported_pr_dir  = options[:exported_pr_dir]
      @migration_branch = options[:migration_branch]
    end

    # Start the process of exporting
    # The exported files will be json files
    def start
      #Parallel.each_with_index(files.take(3), in_processes: 10) do |file_name, index|
      files.each_with_index do |file_name, index|
        begin
          content = JSON.parse(File.read(file_name), symbolize_names: true)
          pr_number_to_be_migrated       = content[:number]
          response_temp_file_creation    = create_temp_file(file_name, pr_number_to_be_migrated)
          create_ref_to_temp_file(pr_number_to_be_migrated, response_temp_file_creation[:commit][:sha])
          response_pull_request_creation = create_pull_request(pr_number_to_be_migrated)
          update_pull_request(response_pull_request_creation[:number], content)
          delete_ref_to_temp_file(pr_number_to_be_migrated)
          puts '*'
        rescue Exception => e
          puts "Error: #{e.message}"
        end
      end
    end

    # Files generated from migration
    def files
      @exported_pr_dir ? Dir.glob(@exported_pr_dir) : []
    end

    def create_temp_file(file_name, pr_number)
      @client.create_contents(@repo_name,
                              "pull_request_#{Time.now.to_i}_#{SecureRandom.hex}.md",
                              "Migrating pull request #{pr_number}",
                              "This Includes a temporary content for the PR migration of #{file_name} #{Time.now.to_i}_#{SecureRandom.hex}" ,
                              branch: @migration_branch)
    end

    def create_pull_request(pr_number)
      @client.create_pull_request(@repo_name,
                                  'master',
                                  "pr_#{pr_number}",
                                  "Title",
                                  "Body")
    end

    def create_ref_to_temp_file(pr_number, sha)
      @client.create_ref(@repo_name, "heads/pr_#{pr_number}", sha)
    end

    def update_pull_request(new_pr_number, content)
      str = content.to_s
      @client.update_pull_request(@repo_name,
                                  new_pr_number,
                                  { title: content[:title],
                                    body: "#{content[:body]}\r\n\n <h5>The JSON format of the PR can be copied from below</h5> \r\n ```ruby\r\n#{str}\r\n```",
                                    state: 'closed' }
                                  )
    end

    def delete_ref_to_temp_file(pr_number)
      @client.delete_ref(@repo_name, "heads/pr_#{pr_number}")
    end



    private

    # Initialize the Github Endpoint if Set
    def initialize_api_endpoint
      if PrMigrator.configuration.github_enterprise_endpoint
        Octokit.configure do |c|
          c.api_endpoint = PrMigrator.configuration.github_enterprise_endpoint
        end
      end
    end
  end
end
