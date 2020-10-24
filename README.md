## I believe Ids would be automatically generated for all model, so to keep it Dry, I omitted it
# User Model
============
#Should have a static role based system for a start, maybe later on we can migrate to dynamic role based system
Attributes
==========
admin: Boolean default false;
name
phone_number
email ##solves the problem of recieving and sending of emails
account_number


#A user can have many campaign, but each campaign must belong to a registered user.

# Campaign Category: 
admin_id: #the user must be have an admin attribute admin==true and the id must be registered
title #this is the name of the category, it has to be a unique name
keywords: #to make searching within the app easy
descriptions # for SEO related stuffs

# A campaign can have many donations but a donation must belong to a campaign

# Campaign Model
===================
user_id #this is the id of the user that created the campaign
campaign_category: #this is the campaign category it belongs to 
donors_id: ## this is the id of the donor that donated to the campaign
target_amount: ## this is target amount for the admin to set
donation_total: ## this would be incremented by the amount of money successfully donated to the account
account_number: ## this is if the user wants to use a different account number 
approved: ## Boolean Field default is false, to the Approved by the admin


# Donations Model
===================
## A donation belongs to a user, but a user can make many donations
campaign_id #this is the campaign it belongs to
user_id #this is the user making the donations, 
amount: # this is an integer field
currency_type: #this is the currency type of the donation

#We will extract the user id and find it in the user db, to get the user email and send notification to the user that made the donation after confirmation that it is successful


#A User can be an Admin or a Normal User by the isAdmin attribute in the user model

# A user has_many campaigns and donations and many campaign category
# If Admin, can create many Campaign_category
# Campaign_category has_many campaigns, 
# A Campaign belongs to a Category and A user
# A Campaign has_many donation but belongs to a user
# A donation belongs to a campaign and also a User




## Latest causes, shouldnt be showing

## RESOURCES, MAKE IT DYNAMIC AND UPLOAD SOME DEFAULT RESOURCES TO THE DB FOR USERS TO VIEW USING THE PDF
## RESOURCES SHOULD TAKE SOMEONE TO THE RESOURCE PAGE

## LOGIN HAS NO TOOLBAR ***Done***
## DONATE SHOULD TAKE SOMEONE TO THE PROGRAMS PAGE TO DONATE ***Done***
## CHANGE IMAGE IN THE SLIDER, SHOUDNT BE ABOUT CHILDREN BUT FAMILY IN THE FIRST SLIDER ***Done***
## REMOVE MOST OF THE IMAGES OF CHILDREN AND REPLACE THEM WITH ADULT, SECURITY STUFFS ***Done***
## UPCOMING PROGRAMS, CLICK A PROGRAM TO DONATE TO ***Done***