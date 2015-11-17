require "rails_helper"

feature "User can manage their meals", js: true do
  let!(:user) { FactoryGirl.create(:user) }

  let!(:other) { create(:meal, user: user, consumed_at: Time.now.change(hour: 1)) }
  let!(:breakfast) { create(:meal, user: user, consumed_at: Time.now.change(hour: 8)) }

  let!(:lunch1) { create(:meal, user: user, consumed_at: Time.now.change(hour: 13)) }
  let!(:lunch2) { create(:meal, user: user, consumed_at: Time.now.change(hour: 14)) }

  let!(:dinner1) { create(:meal, user: user, consumed_at: Time.zone.now.change(hour: 18)) }
  let!(:dinner2) { create(:meal, user: user, consumed_at: Time.zone.now.change(hour: 18) - 5.day) }
  let!(:dinner3) { create(:meal, user: user, consumed_at: Time.zone.now.change(hour: 18) - 6.days) }

  before  do
    sign_in(user)
  end

  after do
    logout
  end

  scenario "filter by time of day" do
    expect(find("ul.list-group")).to have_css("li", count: "7")

    find("#time_of_day_filter label", text: "Breakfast").click
    expect(find("ul.list-group")).to have_css("li", count: "1")

    find("#time_of_day_filter label", text: "Lunch").click
    expect(find("ul.list-group")).to have_css("li", count: "2")

    find("#time_of_day_filter label", text: "Dinner").click
    expect(find("ul.list-group")).to have_css("li", count: "3")
  end

  scenario "filter by date range" do
    expect(find("ul.list-group")).to have_css("li", count: "7")

    # Filter
    within("#start_datetime_filter") do
      expect(page).to have_css("a#filterStartDatetime")
      find("a#filterStartDatetime").click

      find("td", text: (Time.now - 1.day).day, :exact => true).click
      find(".hour", text: "12:00 AM", :exact => true).click
      find(".minute", text: "12:05 AM", :exact => true).click
    end

    within("#end_datetime_filter") do
      expect(page).to have_css("a#filterEndDatetime")

      find("td", text: (Time.now + 1.day).day, :exact => true).click
      find(".hour", text: "11:00 PM", :exact => true).click
      find(".minute", text: "11:55 PM", :exact => true).click
      find("a#filterEndDatetime").click
    end

    expect(find("ul.list-group")).to have_css("li", count: "5")
  end

  scenario "filter out all meals" do
    expect(find("ul.list-group")).to have_css("li", count: "7")

    # Filter
    within("#start_datetime_filter") do
      expect(page).to have_css("a#filterStartDatetime")
      find("a#filterStartDatetime").click

      find("td", text: (Time.now + 1.day).day, :exact => true).click
      find(".hour", text: "12:00 AM", :exact => true).click
      find(".minute", text: "12:05 AM", :exact => true).click
    end

    within("#end_datetime_filter") do
      expect(page).to have_css("a#filterEndDatetime")

      find("td", text: (Time.now + 2.day).day, :exact => true).click
      find(".hour", text: "11:00 PM", :exact => true).click
      find(".minute", text: "11:55 PM", :exact => true).click
      find("a#filterEndDatetime").click
    end

    expect(find("ul.list-group")).to have_css("li", count: "0")
  end

end
