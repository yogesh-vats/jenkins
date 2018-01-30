nestedView('project-a') {
    views {
        listView('prod') {
            jobs {
                regex(/project-a-prod-.*/)
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
