class WelcomeController < ApplicationController

  def index
    binding.pry
    if current_user
      repos_url = current_user.repos_url
      # Get list of repositories for the current user
      response = HTTParty.get(repos_url, headers: {"User-Agent" => "git-organized"})
      # Create Repo objects for each repository
      for i in 0...response.length
        #if Repo.find(name: response[i]['name']).blank?
        binding.pry
        Repo.create(name: response[i]['name'], birthday: response[i]['created_at'], commits_url: response[i]['commits_url'], description: response[i]['description'])
      end
      binding.pry
    end
    binding.pry
  end

end
