class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end


  # Mar 14, hw2
  def index
    @all_ratings = Movie.all_ratings  
    #all_ratings is a class variable of the Movie model
   
#was unable to identify the correct condition to clear the session   
=begin
   if @session_id == nil
      @session_id = session[:session_id]
      session.delete(:ratings)
      session.delete(:sort)
      @selected_ratings = (params[:ratings].present? ? params[:ratings] : @all_ratings)
    end
=end
    
    #saves ratings params in session[:ratings], so that they persist upon 
    #leaving the index page
    if params[:ratings] != nil 
      session[:ratings] = params[:ratings]
      @selected_ratings = session[:ratings]
    end  

    # sets @selected_ratings to all_ratings, when no ratings have been selected 
    if params[:ratings] == nil 
      if session[:ratings] == nil 
         @selected_ratings = (params[:ratings].present? ? params[:ratings] : @all_ratings)
      end
      if session[:ratings] != nil
        @selected_ratings = session[:ratings]
      end
    end
    
    #saves sort params in session[:sort], so that they persist upon leaving the 
    #index page
    if params[:sort] != nil
      session[:sort] = params[:sort]
      @sort = session[:sort]
    end

    if params[:sort] == nil
      if session[:sort] != nil
        @sort = session[:sort]
      end
    end

    #redirects to URI containing appropriate params, if previously chosen 
    #params are only persisting in session[] 
    if params[:ratings] != session[:ratings]
      session[:ratings] = @selected_ratings
      session[:sort] = @sort  
      redirect_to :sort => @sort, :ratings => @selected_ratings  and return
    end

    if session[:sort] != nil
      if params[:sort] != session[:sort]
        session[:sort] = @sort
        redirect_to :sort => @sort, :ratings => @selected_ratings  and return
      end
    end

    #specifies how movies should be displayed, including which ratings 
    if session[:sort] == nil    
        @movies = Movie.find(:all,  :conditions => {:rating => @selected_ratings})  

    #specifies how movies should be displayed, including which ratings and 
    #sorting according to release_date or title   
    elsif session[:sort] != nil
      @movies = Movie.find(:all, :conditions => {:rating => @selected_ratings}, :order => @sort)
    end
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
