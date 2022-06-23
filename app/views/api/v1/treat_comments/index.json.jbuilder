json.treat_comments do
  json.array! @treat_comments, partial: 'treat_comments/treat_comment', as: :treat_comment
end
