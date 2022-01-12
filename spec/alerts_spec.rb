describe 'Alertas de JS', :alerts do

    before(:each) do
        visit '/javascript_alerts'
    end

    it 'alert' do
        click_button 'Alerta'
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Isto é uma mensagem de alerta'
    end

    it 'sim confirma' do
        click_button 'Confirma'
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'Mensagem confirmada'
    end

    it 'nao confirma' do
        click_button 'Confirma'
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'
        page.driver.browser.switch_to.alert.dismiss
        expect(page).to have_content 'Mensagem não confirmada'
    end

    it 'accept prompt', :accept_prompt do
        accept_prompt(with: 'Bruno') do
            click_button 'Prompt'
        end
        expect(page).to have_content 'Olá, Bruno'
    end

    it 'dismiss prompt', :dismiss_prompt do
        click_button 'Prompt'
        page.driver.browser.switch_to.alert.dismiss
        expect(page).to have_content 'Olá, null'
    end
    
end