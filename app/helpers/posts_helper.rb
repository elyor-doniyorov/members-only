module PostsHelper
  def main_message
    if user_signed_in?
      content_tag :div do
        content_tag :h2 do
          "Hello #{current_user.email}"
        end
      end
    else
      content_tag :div do
        content_tag :h2, 'Hello Stranger'
      end
    end
  end

  def user_post(post)
    if user_signed_in? && current_user.id == post.user_id
      content_tag :div, class: 'mt-2' do
        content_tag :ul, class: 'w-50 text-center m-auto list-group' do
          (content_tag :li, post.user.email, class: 'list-group-item active') +
            (content_tag :li, post.title, class: 'list-group-item') +
            (content_tag :li, post.body, class: 'list-group-item')
        end
      end
    else
      content_tag :div, class: 'mt-2' do
        content_tag :ul, class: 'w-50 text-center m-auto list-group' do
          (content_tag :li, post.title, class: 'list-group-item') +
            (content_tag :li, post.body, class: 'list-group-item')
        end
      end
    end
  end

  def user_session
    if user_signed_in?
      content_tag :div, class: 'w-100 text-center py-2 d-flex' do
        (link_to 'sign out', destroy_user_session_path, method: :delete,
                                                        class: 'mr-3 text-decoration-none w-30 mb-1 text-light') +
          (link_to 'new post', new_post_path, class: 'w-30 mb-1 text-decoration-none text-light')
      end
    else
      content_tag :div, class: 'text-center py-2 d-flex' do
        (link_to 'sign in', new_user_session_path, class: 'mr-3 text-decoration-none w-30 mb-1 text-light') +
          (link_to 'sign up', new_user_registration_path, class: 'w-30 mb-1 text-decoration-none text-light')
      end
    end
  end
end
