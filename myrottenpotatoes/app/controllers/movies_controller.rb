class MoviesController < ActionController::Base



def show
  id = params[:id] # retrieve movie ID from URI route
  @movie = Movie.find(id) # look up movie by unique ID
  # will render app/views/movies/show.html.haml by default
end


def new
  # default: render 'new' template
end
#def create
#  @movie = Movie.create!(params[:movie])
#  redirect_to movies_path
#end


# in movies_controller.rb
def create
  #@movie = Movie.create!(params[:movie])
  @movie = Movie.create!(movie_params)
  flash[:notice] = "#{@movie.title} was successfully created."
  redirect_to movies_path
end

# in movies_controller.rb

def edit
  @movie = Movie.find params[:id]
end

def update
  @movie = Movie.find params[:id]
  #@movie.update_attributes!(params[:movie])
  @movie.update_attributes!(movie_params)
  flash[:notice] = "#{@movie.title} was successfully updated."
  redirect_to movie_path(@movie)
end

def destroy
  @movie = Movie.find(params[:id])
  @movie.destroy
  flash[:notice] = "Movie '#{@movie.title}' deleted."
  redirect_to movies_path
end

private
def movie_params
      params.require(:movie).permit(:title, :rating, :description, :release_date)
end


end