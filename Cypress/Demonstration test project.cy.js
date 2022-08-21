Cypress.on('uncaught:exception', (err, runnable) => {
   // returning false here prevents Cypress from
   // failing the test
   return false
 })

describe("DEMONSTRATION TEST PROJECT", () => {
   it ("SUBMIT THE FORM",() => {

   // TC_1 SUBMIT THE FORM ON THE SITE WITH A VALID USERNAME
      cy.login('Oleksandr','qastudy@gmail.com')
      cy.get('#g2599-experienceinyears')
         .select('3-5')
         .should('have.value','3-5')
      cy.get('#contact-form-comment-g2599-comment')
         .type('I like QA')
         .should('have.value','I like QA')
      cy.get('.pushbutton-wide')
         .click()
      cy.get('#contact-form-2599 > h3')
         .should('have.text',"Message Sent (go back)")
      cy.log('**** T_1: User successfully authenticated ****')

   // TC_2 SUBMIT THE FORM ON THE SITE WITH A VALID PASSWORD
      cy.login('Oleksandr','qastudy@gmail.com')
      cy.get('#g2599-experienceinyears')
         .select('3-5')
         .should('have.value','3-5')
      cy.get('#contact-form-comment-g2599-comment')
         .type('I like QA')
         .should('have.value','I like QA')
      cy.get('.pushbutton-wide')
         .click()
      cy.get('#contact-form-2599 > h3')
         .should('have.text',"Message Sent (go back)")
      cy.log('**** T_2: User successfully authenticated ****')

   // TC_3 SUBMIT THE FORM ON THE SITE WITH AN INVALID EMAIL (MISSING @ SYMBOL)
      cy.login('Oleksandr','qastudygmail.com')
      cy.get('#g2599-experienceinyears')
         .select('3-5')
         .should('have.value','3-5')
      cy.get('#contact-form-comment-g2599-comment')
         .type('I like QA')
         .should('have.value','I like QA')
      cy.get('.pushbutton-wide')
         .click()
      cy.get('[onclick="myFunction()"]')
         .should('be.visible')
      cy.log('**** T_3: User is not successfully authenticated ****')

    })
 })
