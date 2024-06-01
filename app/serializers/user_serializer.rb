class UserSerializer
  include JSONAPI::Serializer

  attributes :email, :full_name, :cpf, :birth_date
end
