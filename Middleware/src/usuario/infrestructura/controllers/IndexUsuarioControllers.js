import { Router } from "express";
import { body } from "express-validator";
import { validarCampos } from "../../../compartido/infrestructura/utils/ValidarCampos.js";
import { auntenticacionConductorController } from "./AuntenticacionConductorController.js";
import { validarToken } from "../../../compartido/infrestructura/utils/Token.js";
import { validarTokenController } from "./ValidarTokenController.js";

export class IndexUsuarioControllers {
  constructor() {
    this.routers = Router();
  }

  loadControllers() {
    this.routers.get("/validarToken", validarToken, validarTokenController);
    this.routers.post(
      "/conductor/login",
      [body(["nombreUsuario", "claveAcceso"]).isString(), validarCampos],
      auntenticacionConductorController
    );
  }
}
