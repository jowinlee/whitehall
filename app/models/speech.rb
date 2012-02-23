class Speech < Document
  include Document::RelatedPolicies
  include Document::Countries
  extend Forwardable

  belongs_to :role_appointment

  validates :role_appointment, :speech_type_id, :delivered_on, presence: true

  before_save :populate_organisations_based_on_role_appointment

  def_delegator :speech_type, :genus, :speech_type_genus
  def_delegator :speech_type, :explanation, :speech_type_explanation
  def_delegator :role_appointment, :role, :role

  def speech_type
    SpeechType.find_by_id(speech_type_id)
  end

  def speech_type=(speech_type)
    self.speech_type_id = speech_type && speech_type.id
  end

  def has_summary?
    true
  end

  def person
    role_appointment.person
  end

  private

  def populate_organisations_based_on_role_appointment
    self.organisations = role_appointment.role.organisations
  end
end
