import { Application } from "@hotwired/stimulus";

const application = Application.start();

// Importa y registra tus controladores aquí
// Ejemplo:
// import MyController from "./controllers/my_controller";
// application.register("my-controller", MyController);

export default application;

import ResetFormController from "./controllers/reset_form_controller";
application.register("reset-form", ResetFormController);