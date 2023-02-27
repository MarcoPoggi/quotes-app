class Quote < ApplicationRecord
  # --- relations ---
  belongs_to :company

  # --- validations ---
  validates :name, presence: true

  # --- scopes ---

  scope :ordered_newest, -> { order(id: :desc) }

  # --- callbacks ---

  # OPTION 1

  # after_create_commit -> {
  #   broadcast_prepend_to(
  #     "quotes", #stream channel
  #     partial: "quotes/quote", locals: { quote: self } # what will be inserted?
  #     target: "quotes" # which turbo_trame?
  #   )
  # }

  # OPTION 2

  # after_create_commit -> { broadcast_prepend_later_to "quotes" }
  # after_update_commit -> { broadcast_update_later_to "quotes" }
  # after_destroy_commit -> { broadcast_remove_to "quotes" }

  #OPTION 3

  broadcasts_to ->(quote) { [quote.company, "quotes-container"] }, inserts_by: :prepend
end
