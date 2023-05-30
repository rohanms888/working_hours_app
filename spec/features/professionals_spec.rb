require 'rails_helper'

RSpec.describe 'Professionals', type: :feature do
  describe 'index page' do
    it 'displays a list of professionals' do
      professional1 = Professional.create(name: 'Doctor')
      professional2 = Professional.create(name: 'Lawyer')

      visit professionals_path

      expect(page).to have_content('Doctor')
      expect(page).to have_content('Lawyer')
    end
  end

  describe 'show page' do
    it 'displays the professional details' do
      professional = Professional.create(name: 'Doctor')
      professional.working_hours.create(day: 'Monday', start_time: '09:00', end_time: '17:00')

      visit professional_path(professional)

      expect(page).to have_content('Doctor')
      expect(page).to have_content('Monday')
      expect(page).to have_content('09:00')
      expect(page).to have_content('17:00')
    end
  end

  describe 'create professional' do
    it 'creates a new professional' do
      visit new_professional_path

      fill_in 'Name', with: 'Doctor'
      fill_in 'Day', with: 'Monday'
      fill_in 'Start Time', with: '09:00'
      fill_in 'End Time', with: '17:00'
      click_on 'Create Professional'

      expect(page).to have_content('Professional was successfully created.')
      expect(page).to have_content('Doctor')
      expect(page).to have_content('Monday')
      expect(page).to have_content('09:00')
      expect(page).to have_content('17:00')
    end
  end

  describe 'edit professional' do
    it 'updates the professional' do
      professional = Professional.create(name: 'Doctor')
      professional.working_hours.create(day: 'Monday', start_time: '09:00', end_time: '17:00')

      visit edit_professional_path(professional)

      fill_in 'Name', with: 'Lawyer'
      fill_in 'Day', with: 'Tuesday'
      fill_in 'Start Time', with: '10:00'
      fill_in 'End Time', with: '18:00'
      click_on 'Update Professional'

      expect(page).to have_content('Professional was successfully updated.')
      expect(page).to have_content('Lawyer')
      expect(page).to have_content('Tuesday')
      expect(page).to have_content('10:00')
      expect(page).to have_content('18:00')
    end
  end

  describe 'destroy professional' do
    it 'destroys the professional' do
      professional = Professional.create(name: 'Doctor')

      visit professionals_path

      click_on 'Destroy'

      expect(page).to have_content('Professional was successfully destroyed.')
      expect(page).not_to have_content('Doctor')
    end
  end
end
