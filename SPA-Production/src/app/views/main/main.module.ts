import { HomeComponent } from './../../modules/general/home/home.component';
import { DateAgoPipe } from './../../pipes/date-ago.pipe';
import { AdminCategoryComponent } from './admin/admin-category/admin-category.component';
import { AdminLevelComponent } from './admin/admin-level/admin-level.component';
import { MainRoutingModule } from './main-routing.module';
// Angular
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { CUSTOM_ELEMENTS_SCHEMA, NgModule } from '@angular/core';


// Forms Component


// Tabs Component
import { TabsModule } from 'ngx-bootstrap/tabs';

// Carousel Component
import { CarouselModule } from 'ngx-bootstrap/carousel';

// Collapse Component
import { CollapseModule } from 'ngx-bootstrap/collapse';

// Dropdowns Component
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';

// Pagination Component
import { PaginationModule } from 'ngx-bootstrap/pagination';

// Popover Component
import { ModalModule } from 'ngx-bootstrap/modal';
// Progress Component
import { ProgressbarModule } from 'ngx-bootstrap/progressbar';

// Tooltip Component
// import { TooltipModule } from 'ngx-bootstrap/tooltip';

//Syncfusion ej2-angular-popups module
import { TooltipModule } from '@syncfusion/ej2-angular-popups';

// Components Plugin
import { SwitchModule, RadioButtonModule } from '@syncfusion/ej2-angular-buttons';
import { GridAllModule } from '@syncfusion/ej2-angular-grids';
import { TreeGridAllModule } from '@syncfusion/ej2-angular-treegrid';
import { ButtonModule } from '@syncfusion/ej2-angular-buttons';

import { DropDownListModule } from '@syncfusion/ej2-angular-dropdowns';
import { DropDownTreeModule } from '@syncfusion/ej2-angular-dropdowns';

import { DatePickerModule } from '@syncfusion/ej2-angular-calendars';
import { ToolbarModule } from '@syncfusion/ej2-angular-navigations';
import { CheckBoxModule } from '@syncfusion/ej2-angular-buttons';
import { TimePickerModule } from '@syncfusion/ej2-angular-calendars';
import { DateTimePickerModule } from '@syncfusion/ej2-angular-calendars';
import { NgbModalModule, NgbModule } from '@ng-bootstrap/ng-bootstrap';

import { FilePondModule, registerPlugin } from 'ngx-filepond';
import FilePondPluginFileValidateType from 'filepond-plugin-file-validate-type';
import FilePondPluginImagePreview from 'filepond-plugin-image-preview';
import FilePondPluginFileValidateSize from 'filepond-plugin-file-validate-size';
registerPlugin(FilePondPluginFileValidateType,FilePondPluginFileValidateSize,FilePondPluginImagePreview);
import { NgxDocViewerModule } from 'ngx-doc-viewer';
import {TranslateModule, TranslateLoader} from '@ngx-translate/core';
import {TranslateHttpLoader} from '@ngx-translate/http-loader';
import { HttpClient } from '@angular/common/http';
import { KpiKindComponent } from './admin/kpi-kind/kpi-kind.component';
import { AdminKPIComponent } from './admin/admin-kpi/admin-kpi.component';
import { AdminOCCategoriesComponent } from './admin/admin-occategories/admin-occategories.component';
import { AdminOCComponent } from './admin/admin-oc/admin-oc.component';
import { CategoryKPILevelAdminComponent } from './admin/category-kpilevel-admin/category-kpilevel-admin.component';
import { AdminUserComponent } from './admin/admin-user/admin-user.component';
import { AddUserToLevelComponent } from './admin/add-user-to-level/add-user-to-level.component';
import { CategoryKPILevelComponent } from './user/category-kpilevel/category-kpilevel.component';
import { ChartPeriodComponent } from './user/chart-period/chart-period.component';
import { ListtaskComponent } from './user/listtask/listtask.component';
import { DatasetComponent } from './user/dataset/dataset.component';
import { WorkplaceComponent } from './user/workplace/workplace.component';
import { FavoriteComponent } from './user/favorite/favorite.component';
import { ListHistoryNotificationComponent } from './user/list-history-notification/list-history-notification.component';
import { LateOnUploadComponent } from './user/late-on-upload/late-on-upload.component';
import { MaintainComponent } from './../../modules/maintain/maintain/maintain.component';
import { CompareComponent } from './user/compare/compare.component';
import { NotFoundComponent } from './../../modules/general/not-found/not-found.component';
import { MentionModule } from 'angular-mentions';
import { ForbiddenComponent } from './../../modules/general/forbidden/forbidden.component';
import { OverviewComponent } from './admin/overview/overview.component';
import { KPITrendViewComponent } from './admin/kpitrend-view/kpitrend-view.component';
import { DxDataGridModule, DxBulletModule,DxTemplateModule,DxSelectBoxModule,DxCheckBoxModule } from 'devextreme-angular';
import { HomeAdminComponent } from './../../modules/general/home-admin/home-admin.component';
import { MultiSelectModule } from '@syncfusion/ej2-angular-dropdowns';
export function HttpLoaderFactory(http: HttpClient) {
  return new TranslateHttpLoader(http, './assets/i18n/', '.json');
}
import { TabModule } from '@syncfusion/ej2-angular-navigations';
import { NgxSpinnerModule } from 'ngx-spinner';

@NgModule({

  imports: [
    TabModule,
    NgxSpinnerModule,
    MentionModule,
    MultiSelectModule,
    DxDataGridModule,
    DxTemplateModule,
    DxBulletModule,
    DxSelectBoxModule,
    DxCheckBoxModule,
    NgxDocViewerModule,
    TranslateModule,
    FilePondModule,
    CommonModule,
    TreeGridAllModule,
    GridAllModule,
    DateTimePickerModule,
    TimePickerModule,
    CheckBoxModule,
    TooltipModule,
    ToolbarModule,
    DatePickerModule,
    NgbModalModule,
    NgbModule,
    ButtonModule,
    SwitchModule,
    RadioButtonModule,
    DropDownListModule,
    FormsModule,
    DropDownTreeModule,
    ModalModule.forRoot(),
    MainRoutingModule,
    BsDropdownModule.forRoot(),
    TabsModule,
    CarouselModule.forRoot(),
    TranslateModule.forRoot({
      loader: {
        provide: TranslateLoader,
        useFactory: HttpLoaderFactory,
        deps: [HttpClient]
      },
      defaultLanguage: 'en'
    }),
    CollapseModule.forRoot(),
    PaginationModule.forRoot(),
    ProgressbarModule.forRoot()
  ],

  declarations: [
    DateAgoPipe,
    NotFoundComponent,
    OverviewComponent,
    HomeAdminComponent,
    ForbiddenComponent,
    KPITrendViewComponent,
    // LoginComponent,
    CompareComponent,
    WorkplaceComponent,
    HomeComponent,
    FavoriteComponent,
    ListHistoryNotificationComponent,
    LateOnUploadComponent,
    MaintainComponent,
    AdminLevelComponent,
    KpiKindComponent,
    AdminKPIComponent,
    AdminUserComponent,
    AdminOCComponent,
    CategoryKPILevelAdminComponent,
    CategoryKPILevelComponent,
    ChartPeriodComponent,
    ListtaskComponent,
    DatasetComponent,
    AdminOCCategoriesComponent,
    AddUserToLevelComponent,
    AdminCategoryComponent
  ],
  providers: [],
  schemas: [ CUSTOM_ELEMENTS_SCHEMA ]
})
export class MainModule { }
