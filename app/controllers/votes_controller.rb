class VotesController < ApplicationController
  def create
    vote = Vote.new(user: current_user, photo: Photo.find(params[:photo_id]), vote_type: params[:vote_type])
    if vote.save
      head 200
    else
      head 400
    end
  end
end
