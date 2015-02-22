module API
  module V1
    # Main API class for WallPosts
    class WallPosts < Grape::API
      include API::V1::Defaults

      resource :wall_posts do
        desc 'Return all wall_posts'
        get '', root: 'vk/wall_post' do
          VK::WallPost.all
        end

        desc 'Return a wall_post'
        params do
          requires :id, type: String, desc: 'ID of the wall_post'
        end
        get ':id', root: 'vk/wall_post' do
          VK::WallPost.where(id: permitted_params[:id]).first!
        end

        desc 'Create a wall post.'
        params do
          requires :id, type: String, desc: 'ID of wall post'
          requires :owner_id, type: String, desc: 'ID of wall owner '
          requires :from_id, type: String, desc: 'ID of author'
          requires :text, type: String, desc: 'Your wall post text.'
          requires :date, type: String,
                          desc: "Date of publishing post in format 'dd-mm-yyyy'"
        end
        post do
          VK::WallPost.create!(id: params[:id],
                               owner_id: params[:owner_id],
                               from_id: params[:from_id],
                               text: params[:text],
                               date: params[:date]
                         )
        end

        desc 'Update a wall post.'
        params do
          requires :id, type: String, desc: 'ID of wall post'
          optional :text, type: String, desc: 'Your wall post text.'
          optional :date, type: String,
                          desc: "Date of publishing post in format 'dd-mm-yyyy'"
        end
        put do
          hash = {}
          hash[:text] = params[:text] if params[:text].present?
          hash[:date] = params[:date] if params[:date].present?
          VK::WallPost.update(params[:id], hash)
        end

        desc 'Delete a status.'
        params do
          requires :id, type: String, desc: 'ID of wall post'
        end
        delete ':id' do
          VK::WallPost.find(params[:id]).destroy
        end
      end
    end
  end
end
