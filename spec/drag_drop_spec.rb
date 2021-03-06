describe "Drag and Drop", :drop do
    before(:each) do
        visit "/drag_and_drop"
    end

    it 'homem aranha pertence ao time do stark' do
        stark = find('.team-stark .column')
        cap = find('.team-cap .column')

        spiderman = find('img[alt="Homem Aranha"]')
        spiderman.drag_to stark

        expect(stark).to have_css 'img[alt="Homem Aranha"]'
        expect(cap).not_to have_css '.team-cap column'
    end

    after(:each) do
        sleep 3
    end
end