job("HelloWorldAMEX") {
  description("I\'ll say hello to world.")
  logRotator(-1, 10)
  steps {
      shell('echo "Hello World!"')
   }
}
