module FlashHelpers
  Capybara.add_selector(:flash_type) do
    css { |type| "#flash.#{type}" }
  end
end