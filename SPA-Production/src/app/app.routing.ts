import { ConfirmPasswordComponent } from './modules/general/confirm-password/confirm-password.component';
import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";

// Import Containers
import { DefaultLayoutComponent } from "./containers";
import { ForgotPasswordComponent } from "./modules/general/forgot-password/forgot-password.component";

import { P404Component } from "./views/error/404.component";
import { P500Component } from "./views/error/500.component";
import { LoginComponent } from "./views/login/login.component";
import { AuthGuard } from "./_core/_guards/auth.guard";

export const routes: Routes = [
  { path: "",
    redirectTo: "login",
    pathMatch: "full"
  },

  {
    path: "404",
    component: P404Component,
    data: {
      title: "Page 404",
    },
  },

  {
    path: "500",
    component: P500Component,
    data: {
      title: "Page 500",
    },
  },

  {
    path: "login",
    component: LoginComponent,
    data: {
      title: "Login Page",
    },
  },

  // Forgot-password
  {
    path: "ForgotPassword",
    component: ForgotPasswordComponent,
  },
   // recoverysuccess
   {
    path: "recoverysuccess",
    component: ConfirmPasswordComponent,
  },
  {
    path: "",
    component: DefaultLayoutComponent,
    data: {
      // title: "Home",
    },
    children: [
      {
        path: '',
        loadChildren: () => import('./views/main/main.module').then(m => m.MainModule)
      },

      {
        path: "login",
        loadChildren: () => import("./app.module").then((m) => m.AppModule),
      },

      // {
      //   path: "todolist",
      //   loadChildren: () => import("./views/main/main.module").then((m) => m.MainModule),
      // },

    ],
  },

  { path: "**", component: P404Component },

];

@NgModule({
  imports: [RouterModule.forRoot(routes, { relativeLinkResolution: 'legacy' })],
  exports: [RouterModule],
})
export class AppRoutingModule {}
