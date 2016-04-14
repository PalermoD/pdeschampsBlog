class ArticlesController < ApplicationController
	http_basic_authenticate_with name: "pdeschamps", password: "spiderman", only: [:create, :destroy, :edit]

	 def index
       @articles = Article.all
     end

    
 
     def show
        @article = Article.find(params[:id])
       

        respond_to do |format|
        format.html  #show.html.erb
        format.json { render json: @article }
      end
     end
 
    def new
        @article = Article.new
        respond_to do |format|
        format.html #new.html.erb
        format.json { render json: @article }
       end
    end

     def edit
       @article = Article.find(params[:id])
     end

	def create
      @article = Article.new(article_params)
      respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Announcement was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        
      end
    end
  end
 
    
    

    def update
       @article = Article.find(params[:id])
 
       if @article.update(article_params)
         redirect_to @article
       else
         render 'edit'
       end
    end

    def destroy
       @article = Article.find(params[:id])
       @article.destroy
 
       redirect_to articles_path
    end

   

    private
      def article_params
        params.require(:article).permit(:title, :text)
      end

end
