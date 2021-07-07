
import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { HomeComponent } from "../../modules/general/home/home.component";
import { AdminLevelComponent } from "./admin/admin-level/admin-level.component";
import { AuthGuard } from "../../_core/_guards/auth.guard";
import { Role } from "../../_core/_models/role";
import { KpiKindComponent } from "./admin/kpi-kind/kpi-kind.component";
import { AdminKPIComponent } from "./admin/admin-kpi/admin-kpi.component";
import { AdminCategoryComponent } from "./admin/admin-category/admin-category.component";
import { AdminOCCategoriesComponent } from "./admin/admin-occategories/admin-occategories.component";
import { AdminOCComponent } from "./admin/admin-oc/admin-oc.component";
import { CategoryKPILevelAdminComponent } from "./admin/category-kpilevel-admin/category-kpilevel-admin.component";
import { AdminUserComponent } from "./admin/admin-user/admin-user.component";
import { AddUserToLevelComponent } from "./admin/add-user-to-level/add-user-to-level.component";
import { CategoryKPILevelComponent } from "./user/category-kpilevel/category-kpilevel.component";
import { ChartPeriodComponent } from "./user/chart-period/chart-period.component";
import { ListtaskComponent } from "./user/listtask/listtask.component";
import { DatasetComponent } from "./user/dataset/dataset.component";
import { WorkplaceComponent } from "./user/workplace/workplace.component";
import { FavoriteComponent } from "./user/favorite/favorite.component";
import { ListHistoryNotificationComponent } from "./user/list-history-notification/list-history-notification.component";
import { LateOnUploadComponent } from "./user/late-on-upload/late-on-upload.component";
import { MaintainComponent } from "../../modules/maintain/maintain/maintain.component";
import { LoginComponent } from "../login/login.component";
import { ForgotPasswordComponent } from "../../modules/general/forgot-password/forgot-password.component";
import { ConfirmPasswordComponent } from "../../modules/general/confirm-password/confirm-password.component";
import { CompareComponent } from "./user/compare/compare.component";
import { NotFoundComponent } from "../../modules/general/not-found/not-found.component";
import { ForbiddenComponent } from "../../modules/general/forbidden/forbidden.component";
import { OverviewComponent } from "./admin/overview/overview.component";
import { KPITrendViewComponent } from "./admin/kpitrend-view/kpitrend-view.component";
import { HomeAdminComponent } from "../../modules/general/home-admin/home-admin.component";
const routes: Routes = [
  {
    path: "",
    // data: {
    //   title: 'ess',
    //   breadcrumb: 'Home'
    // },
    children: [
      //setting

      // home/admin
      {
        path: "home/admin",
        data: {
          // // breadcrumb: "Home",
          url: "home/admin",
        },
        children: [
          {
            path: "",
            component: HomeAdminComponent,
            canActivate: [AuthGuard],
            data: {
              title: "Home Moderator",
            },
          },
        ],
      },

      //Home
      {
        path: "home",
        data: {
          title: "Home",
        },
        component: HomeComponent,
      },

      // Overview
      {
        path: "Overview",
        data: {
          // breadcrumb: "Home",
          url: "home",
        },
        children: [
          {
            path: "",
            component: OverviewComponent,
            canActivate: [AuthGuard],
            data: {
              title: "OverView",
              breadcrumb: "Overview",
              url: "Overview",
              role: ["Admin", "User"],
            },
          },
        ],
      },

      // KPITrendView
      {
        path: "",
        data: {
          // // breadcrumb: "Home",
          url: "home",
        },
        children: [
          {
            path: "KPITrendView/:kpilevelcode/:catid/:period/:year/:start/:end",
            component: KPITrendViewComponent,
            canActivate: [AuthGuard],
            data: {
              title: "Overview",
              breadcrumb: "OverView",
              url: "Overview",
              role: ["Admin", "User"],
            },
            children: [
              {
                path: "",
                component: KPITrendViewComponent,
                canActivate: [AuthGuard],
                data: {
                  title: "KPI Trend View",
                  breadcrumb: "KPI Trend View",
                  role: ["Admin", "User"],
                },
              },
            ],
          },
        ],
      },

      // adminLevel
      {
        path: "AdminLevel",
        data: {
          // // breadcrumb: "Home",
          url: "home/admin",
        },
        children: [
          {
            path: "",
            component: AdminLevelComponent,
            canActivate: [AuthGuard],
            data: {
              title: "AdminLevel",
              breadcrumb: "Organization Chart",
              url: "AdminLevel",
              role: [Role.Admin],
            },
          },
        ],
      },

      // adminKPI-Kind
      {
        path: "KpiKind",
        data: {
          // breadcrumb: "Home",
          url: "home/admin",
        },
        children: [
          {
            path: "",
            component: KpiKindComponent,
            canActivate: [AuthGuard],
            data: {
              title: "KPI KIND",
              breadcrumb: "KPI KIND",
              url: "KpiKind",
              role: [Role.Admin],
            },
          },
        ],
      },

      // adminKPI
      {
        path: "AdminKPI",
        data: {
          // breadcrumb: "Home",
          url: "home/admin",
        },
        children: [
          {
            path: "",
            component: AdminKPIComponent,
            canActivate: [AuthGuard],
            data: {
              title: "AdminKPI",
              breadcrumb: "KPI",
              url: "AdminKPI",
              role: [Role.Admin],
            },
          },
        ],
      },

      // adminCategory
      {
        path: "AdminCategory",
        data: {
          // breadcrumb: "Home",
          url: "home/admin",
        },
        children: [
          {
            path: "",
            component: AdminCategoryComponent,
            canActivate: [AuthGuard],
            data: {
              title: "AdminCategory",
              breadcrumb: "Category",
              url: "AdminCategory",
              role: [Role.Admin],
            },
          },
        ],
      },

      // OCCategories
      {
        path: "OCCategories",
        data: {
          // breadcrumb: "Home",
          url: "home/admin",
        },
        children: [
          {
            path: "",
            component: AdminOCCategoriesComponent,
            canActivate: [AuthGuard],
            data: {
              title: "OC Category",
              breadcrumb: "OC Category",
              url: "OCCategories",
              role: [Role.Admin],
            },
          },
        ],
      },

      // AdminOC
      {
        path: "AdminOC",
        data: {
          // breadcrumb: "Home",
          url: "home/admin",
        },
        children: [
          {
            path: "",
            component: AdminOCComponent,
            canActivate: [AuthGuard],
            data: {
              title: "OC KPI",
              breadcrumb: "OC KPI",
              url: "AdminOC",
              role: [Role.Admin],
            },
          },
        ],
      },

      // Category-KpiLevel-Admin
      {
        path: "CategoryKPILevelAdmin",
        data: {
          // breadcrumb: "Home",
          url: "home/admin",
          role: [Role.Admin],
        },
        children: [
          {
            path: "",
            component: CategoryKPILevelAdminComponent,
            canActivate: [AuthGuard],
            data: {
              title: "OC Category KPI",
              breadcrumb: "OC Category KPI",
              url: "CategoryKPILevelAdmin",
              role: [Role.Admin],
            },
          },
        ],
      },

      // AdminUser
      {
        path: "AdminUser",
        data: {
          // breadcrumb: "Home",
          url: "home/admin",
          role: [Role.Admin],
        },
        children: [
          {
            path: "",
            component: AdminUserComponent,
            canActivate: [AuthGuard],
            data: {
              title: "AdminUser",
              breadcrumb: "User",
              url: "AdminUser",
              role: [Role.Admin],
            },
          },
        ],
      },

      // AddUserToLevel
      {
        path: "AddUserToLevel",
        data: {
          // breadcrumb: "Home",
          url: "home/admin",
          role: [Role.Admin],
        },
        children: [
          {
            path: "",
            component: AddUserToLevelComponent,
            canActivate: [AuthGuard],
            data: {
              title: "Add User Of List Each Levels",
              breadcrumb: "Add User To OC",
              url: "AddUserToLevel",
              role: [Role.Admin],
            },
          },
        ],
      },

      // CategoryKPILevel
      {
        path: "",
        data: {
          // breadcrumb: "Home",
          url: "home",
        },
        children: [
          {
            path: "CategoryKPILevel",
            component: CategoryKPILevelComponent,
            canActivate: [AuthGuard],
            data: {
              title: "CategoryKPILevel",
              breadcrumb: "KPI",
              url: "CategoryKPILevel",
              role: [Role.Admin, Role.User],
            },
          },
        ],
      },

      // ChartPeriod
      {
        path: "",
        data: {
          // breadcrumb: "Home",
          url: "home",
        },
        children: [
          {
            path: "ChartPeriod/:kpilevelcode/:catid/:period/:year/:start/:end",
            component: ChartPeriodComponent,
            canActivate: [AuthGuard],
            data: {
              breadcrumb: "KPI",
              url: "CategoryKPILevel",
              role: [Role.Admin, Role.User],
            },
            children: [
              {
                path: "",
                component: ChartPeriodComponent,
                canActivate: [AuthGuard],
                data: {
                  title: "Chart Period",
                  breadcrumb: "Chart",
                  role: [Role.Admin, Role.User],
                },
              },
            ],
          },
        ],
      },

      // ChartPeriod List Task
      {
        path: "ChartPeriod/ListTasks/:kpilevelcode",
        children: [
          {
            path: "",
            component: ListtaskComponent,
            canActivate: [AuthGuard],
            data: {
              title: "Chart Period - List Task",
              role: [Role.Admin, Role.User],
            },
          },
        ],
      },

      // ChartPeriod2
      {
        path: "",
        data: {
          // breadcrumb: "Home",
          url: "home",
          role: [Role.Admin, Role.User],
        },
        children: [
          {
            path: "ChartPeriod/:kpilevelcode/:catid/:period/:year/:start/:end/:type/:comID/:dataID/:title",
            component: ChartPeriodComponent,
            canActivate: [AuthGuard],
            data: {
              breadcrumb: "KPI",
              url: "CategoryKPILevel",
              role: [Role.Admin, Role.User],
            },
            children: [
              {
                path: "",
                component: ChartPeriodComponent,
                canActivate: [AuthGuard],
                data: {
                  title: "Chart Period",
                  breadcrumb: "Chart",
                  role: [Role.Admin, Role.User],
                },
              },
            ],
          },
        ],
      },

      // Dataset
      {
        path: "",
        data: {
          // breadcrumb: "Home",
          url: "home",
        },
        children: [
          {
            path: "Dataset/:catid/:period/:start/:end/:year",
            component: DatasetComponent,
            canActivate: [AuthGuard],
            data: {
              breadcrumb: "KPI",
              url: "CategoryKPILevel",
              role: [Role.Admin, Role.User],
            },
            children: [
              {
                path: "",
                component: DatasetComponent,
                canActivate: [AuthGuard],
                data: {
                  title: "Dataset",
                  breadcrumb: "Dataset",
                  role: [Role.Admin, Role.User],
                },
              },
            ],
          },
        ],
      },

      // Dataset2
      {
        path: "",
        data: {
          // breadcrumb: "Home",
          url: "home",
        },
        children: [
          {
            path: "Dataset/:catid/:period/:start/:end/:year/:type/:comID/:dataID/:title",
            component: DatasetComponent,
            canActivate: [AuthGuard],
            data: {
              breadcrumb: "KPI",
              url: "CategoryKPILevel",
              role: [Role.Admin, Role.User],
            },
            children: [
              {
                path: "",
                component: DatasetComponent,
                canActivate: [AuthGuard],
                data: {
                  title: "Dataset",
                  breadcrumb: "Dataset",
                  role: [Role.Admin, Role.User],
                },
              },
            ],
          },
        ],
      },

      // Workplace
      {
        path: "Workplace",
        data: {
          // breadcrumb: "Home",
          url: "home",
        },
        children: [
          {
            path: "",
            component: WorkplaceComponent,
            canActivate: [AuthGuard],
            data: {
              title: "Workplace",
              breadcrumb: "Workplace",
              role: [Role.Admin, Role.User],
            },
          },
        ],
      },

      // Favorite
      {
        path: "Favourite",
        data: {
          // breadcrumb: "Home",
          url: "home",
        },
        children: [
          {
            path: "",
            component: FavoriteComponent,
            canActivate: [AuthGuard],
            data: {
              title: "Favourite",
              breadcrumb: "Favourite",
              role: [Role.Admin, Role.User],
            },
          },
        ],
      },

      // History Notification
      {
        path: "HistoryNotification",
        data: {
          // breadcrumb: "Home",
          url: "home",
          role: [Role.Admin, Role.User],
        },
        children: [
          {
            path: "",
            component: ListHistoryNotificationComponent,
            canActivate: [AuthGuard],
            data: {
              title: "History Notification",
              breadcrumb: "History Notification",
              role: [Role.Admin, Role.User],
            },
          },
        ],
      },

      // LateOnUpload
      {
        data: {
          // breadcrumb: "Home",
          url: "home",
        },
        path: "LateOnUpload/:notification",
        children: [
          {
            path: "",
            component: LateOnUploadComponent,
            canActivate: [AuthGuard],
            data: {
              title: "LateOnUpload",
              breadcrumb: "LateOnUpload",
              role: [Role.Admin, Role.User],
            },
          },
        ],
      },

      // Maintain
      { path: "maintanin", component: MaintainComponent },

      // Maintain
      // { path: 'setting', component: SettingComponent, },

      // // login
      // {
      //   path: "login",
      //   component: LoginComponent,
      // },


      // Compare
      {
        path: "Compare/:obj",
        data: {
          // breadcrumb: "Home",
          url: "home",
        },
        children: [
          {
            path: "",
            component: CompareComponent,
            data: {
              title: "Compare",
              breadcrumb: "Compare",
              role: [Role.Admin, Role.User],
            },
          },
        ],
      },

      {
        path: "404",
        data: {
          // breadcrumb: "Home",
          url: "home",
        },
        children: [
          {
            path: "",
            component: NotFoundComponent,
            data: {
              title: "404 NOT FOUND",
              breadcrumb: "404",
              url: "404",
            },
          },
        ],
      },

      {
        path: "403",
        data: {
          // breadcrumb: "Home",
          url: "home",
        },
        children: [
          {
            path: "",
            component: ForbiddenComponent,
            data: {
              title: "403",
              breadcrumb: "403",
              url: "403",
            },
          },
        ],
      },

      {
        path: "**",
        children: [
          {
            path: "",
            component: NotFoundComponent,
            data: {
              title: "ERROR",
            },
          },
        ],
      },
    ],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class MainRoutingModule {}
