def mark_organisation_as_replaced(organisation_name)
  agency = Organisation.find_by_name(organisation_name)
  agency.govuk_closed_status = 'replaced'
  agency.save
end

mark_organisation_as_replaced("Vehicle and Operator Services Agency")
mark_organisation_as_replaced("Driving Standards Agency")
mark_organisation_as_replaced("UK Border Agency")
