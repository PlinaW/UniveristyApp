class ApplicationController < ActionController::Base

    before_action :require_user


    # Metody do sprawdzenia logowania sa tworzone w ApplicationController,
    # poniewaz dzieki temu beda dostepne TYLKO w kontrolerach, mozna byloby je 
    # rowniez wprowadzic do helpers -> application_helper, ale bylyby dost-
    # epne tylko dla wszystkich widokow. 
    # Obecnie te metody sa dostpene TYLKO w kontrolerach.

    helper_method :current_user, :logged_in?

    # powyzsze helper_method umozliwia dostep tych metod rowniez dla widokow

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    # Powyzsza metoda:
    # TRZECI CZLON: if a session variable is set
    # DRUGI CZLON: then it finds that user based on the user_id in the session
    # (from the session hash)
    # ---
    # it grabs a user_id and it finds a user based on that
    # PIERWSZY CZLON: and we're assigning it to this @current_user variable.
    # we can use this to see if there is a logged in user.

    # metoda current_user ->  I can always refer to my current user, 
    #                         and if I have a current user, it gets 
    #                         me the current user at all times.

    # modyfikacja polegajaca na dopisaniu || nazywa sie memorisation,
    # pozwala ona zapamietac zmienna current_user i dzieki temu nie trzeba caly czas
    # tworzy zapytania do bazy. 
    #
    # We are quaring the DB to user class finding in the user table based on user_id.
    # We are grabbing that particular user object.
    # Now, I don't want to keep hitting the database again and again if 
    # I already have @current_user as an object.

    # Two pipes equal, and this is called memorisation, this will only perform this query 
    # query jest po znaku =
    # if my @current_user object does not exist and if my @current_user object exists,
    # then it does not perform this.
    # It simply returns this current_user object.
    # So I'm skipping an entire database lookup, which is great.
    # A table lookup is costly, so I don't have to perform this.

    def logged_in?
        !!current_user
    end

    # w metodzie logged_in? zmieniamy current_user na boolean true/false 
    # i dzieki temu sprawdzamy, czy current_user jest true or false
    # czyli czy jest zalogowany, czy nie.

    def require_user
      if !logged_in?
        flash[:notice] = "You must be logged in to perform that action"
        redirect_to login_path
      end
    end
    
    # metoda wymagajaca zalogowania

end
