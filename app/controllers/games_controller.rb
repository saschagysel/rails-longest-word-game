class GamesController < ApplicationController
  def new
    @letters = [*('A'..'Z')].sample(10)
  end

  def score
    word = params[:word]
    @letters_provided = params[:letters]
    time_start = Time.parse(params[:time])
    time_end = Time.now
    @time_elapsed = time_end - time_start
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    word_string = open(url).read
    found = JSON.parse(word_string)
    result = found['found']
    if result == true
      @message = "Word \"#{word}\" IS an English word!"
    else
      @message = "Word \"#{word}\" IS NOT an English word!"
    end
  end
end
