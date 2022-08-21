
// MY COMMANDS FOR THE DEMONSTRATION TEST PROJECT
Cypress.Commands.add('login', (name, email) => { 
   cy.viewport(1920, 1080)

   cy.visit("https://www.globalsqa.com/samplepagetest/?contact-form-hash=7451d6322607909818ec6641508a0315d590839b")
   cy.location('protocol').should('eq','https:')

   cy.get('#g2599-name').type(name)
   cy.get('#g2599-email').type(email)
      
})
