class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate, :phones, :address

  def attributes(*args)
    h = super(*args)
    # h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?) PT-BR
    h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    h
  end
end
