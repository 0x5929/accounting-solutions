// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
// import * as bootstrap from "bootstrap"

// fixes turbo link issues with legacy jquery code
Turbo.session.drive = false