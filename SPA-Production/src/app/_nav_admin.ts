import { INavData } from '@coreui/angular';

export const navItemsAdmin: INavData[] = [
  {
    name: 'Home',
    url: '/home',
    icon: 'icon-home',
  },
  {
    name: 'Moderator',
    url: '/home/admin',
    icon: 'fa fa-cog',
    children: [

      {
        name: '(1) OC',
        url: '/AdminLevel',
        icon: 'fa fa-circle-thin'
      },

      {
        name: '(2) KPI Kind',
        url: '/KpiKind',
        icon: 'fa fa-circle-thin'
      },

      {
        name: '(3) KPI',
        url: '/AdminKPI',
        icon: 'fa fa-circle-thin'
      },

      {
        name: '(4) Categories',
        url: '/AdminCategory',
        icon: 'fa fa-circle-thin'
      },

      {
        name: '(5) OC Category',
        url: '/OCCategories',
        icon: 'fa fa-circle-thin'
      },

      {
        name: '(6) OC KPI',
        url: '/AdminOC',
        icon: 'fa fa-circle-thin'
      },

      {
        name: '(7) OC Category KPI',
        url: '/CategoryKPILevelAdmin',
        icon: 'fa fa-circle-thin'
      },

      {
        name: '(8) User',
        url: '/AdminUser',
        icon: 'fa fa-circle-thin'
      },

      {
        name: '(9) OC User',
        url: '/AddUserToLevel',
        icon: 'fa fa-circle-thin'
      },

      {
        name: 'KPI Overview',
        url: '/Overview',
        icon: 'fa fa-circle-thin'
      }

    ]
  }

];
