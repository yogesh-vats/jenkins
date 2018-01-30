job("HelloPerson") {
 description("I\'ll say hello to person.")
 logRotator(-1, 10)
  parameters {
    	choiceParam('SALUTATION', ['Mr.', 'Mrs.', 'Ms.'], 'your salutation')
        stringParam('NAME', '', 'your name')
    }
  steps {
    shell('echo "Hello ${SALUTATION} ${NAME}!"')
   }
}
