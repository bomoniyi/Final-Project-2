Rails.application.routes.draw do

  get("/", { :controller => "application", :action => "homepage" })

  # Routes for the Story resource:

  # CREATE
  post("/insert_story", { :controller => "stories", :action => "create" })
          
  # READ
  get("/stories", { :controller => "stories", :action => "index" })
  
  get("/stories/:path_id", { :controller => "stories", :action => "show" })
  
  # UPDATE
  
  post("/modify_story/:path_id", { :controller => "stories", :action => "update" })
  
  # DELETE
  get("/delete_story/:path_id", { :controller => "stories", :action => "destroy" })

  #------------------------------

  # Routes for the Joined group resource:

  get("/join_group/:path_id", { :controller => "meeting_groups", :action => "add_user_joinedgroup" })

  # CREATE
  post("/insert_joined_group", { :controller => "joined_groups", :action => "create" })
          
  # READ
  get("/joined_groups", { :controller => "joined_groups", :action => "index" })
  
  get("/joined_groups/:path_id", { :controller => "joined_groups", :action => "show" })
  
  # UPDATE
  
  post("/modify_joined_group/:path_id", { :controller => "joined_groups", :action => "update" })
  
  # DELETE
  get("/delete_joined_group/:path_id", { :controller => "joined_groups", :action => "destroy" })

  #------------------------------

  # Routes for the Meeting group resource:

  # CREATE
  post("/insert_meeting_group", { :controller => "meeting_groups", :action => "create" })
          
  # READ
  get("/meeting_groups", { :controller => "meeting_groups", :action => "index" })
  
  get("/meeting_groups/:path_id", { :controller => "meeting_groups", :action => "show" })
  
  # UPDATE
  
  post("/modify_meeting_group/:path_id", { :controller => "meeting_groups", :action => "update" })
  
  # DELETE
  get("/delete_meeting_group/:path_id", { :controller => "meeting_groups", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
