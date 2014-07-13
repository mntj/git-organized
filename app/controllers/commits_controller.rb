class CommitsController < ApplicationController

  def index
    commits = Commit.all
    render json: commits.to_json
  end

  def show
    commit = Commit.find(params[:id])
    render json: commit.to_json
  end

  def create
    commit = Commit.create(commit_params)
    render json: commit.to_json
  end

  def update
    commit = Commit.find(params[:id])
    commit.update(commit_params)
    render json: commit.to_json
  end

  def destroy
    commit = Commit.find(params[:id])
    commit.destroy
    render json: commit.to_json
  end

  private

  def commit_params
    params.require(:commit).permit(:commiter_name, :message, :date, :sha, :url, :avatar_url)
  end

end
