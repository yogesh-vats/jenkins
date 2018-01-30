nestedView("${Project}") {
    views {
        listView("$ENV") {
            jobs {
                regex("/${PROJECT}-${ENV}-.*/")
            }
            columns {
                status()
                weather()
                name()
                lastSuccess()
                lastFailure()
            }
        }
    }
}
