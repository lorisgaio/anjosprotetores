RailsAdmin.config do |config|

  #Erro do ActiveStorage no rails 5.2
  config.excluded_models = ['ActiveStorage::Blob', 'ActiveStorage::Attachment']

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.main_app_name = ["Anjos Protetores", "Canil"]

  config.model User do
    navigation_icon 'fa fa-user'
    create do
      field :name
      field :kind
      field :status
      field :email
      field :password
      field :password_confirmation
    end

    edit do
      field :name
      field :kind
      field :status
      field :email
      field :password
      field :password_confirmation
    end

    list do
      field :name
      field :kind
      field :status
      field :email
    end
  end

  config.model Animal do
    navigation_icon 'fa fa-paw'
    list do
      field :id
      field :name
      field :tutor
      field :breed
      field :age
      field :gender
      # field :castrated
      # field :vaccinated
      # field :dewormed
    end
  end

  config.model Tutor do
    navigation_icon 'fa fa-home'
    list do
      field :id
      field :name
      field :address
      field :phone
      field :animals
      # field :gender
      # field :castrated
      # field :vaccinated
      # field :dewormed
    end
  end










  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
