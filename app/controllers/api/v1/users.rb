module API
  module V1
    # User API class
    class Users < Grape::API
      include API::V1::Defaults
      resource :users do
        desc 'Sign In user'
        params do
          requires :login, type: String, desc: 'User login'
          requires :password, type: String, desc: 'User password'
        end
        post 'sign_in' do
          AccessProvider.authenticate(login: permitted_params[:login],
                                      password: permitted_params[:password])
        end
      end
    end
  end
end
