import { KpiKindService } from '../../../../../../src/app/_core/_services/kpi-kind.service';
import { Component, OnInit  } from '@angular/core';
import { NgbModal  } from '@ng-bootstrap/ng-bootstrap';
import { ToolbarItems } from '@syncfusion/ej2-angular-grids';
import { AlertifyService } from '../../../../_core/_services/alertify.service';
@Component({
  selector: 'app-kpi-kind',
  templateUrl: './kpi-kind.component.html',
  styleUrls: ['./kpi-kind.component.css']
})
export class KpiKindComponent implements OnInit {
  public toolbar: ToolbarItems[];
  editSettings: any = { allowEditing: true, allowAdding: true, allowDeleting: true, mode: 'Normal', allowEditOnDblClick: false };
  toolbarOptions = ['Search']
  searchSettings: any = { hierarchyMode: 'Name' }
  public data: object;
  pageSettings = {pageCount: 5}
  pageSize: any = 1000
  lines: string = 'Both';
  modalReference: any;
  NameTW: string = null
  NameEn: string = null
  NameVI: string = null
  NameVIEdit: string = null
  NameEnEdit: string = null
  NameTWEdit: string = null
  ID: any;
  constructor(
    private kpiKindService: KpiKindService,
    private modalService: NgbModal,
    private alertify : AlertifyService
  ) { }

  ngOnInit(): void {
    this.getAll();
  }

  getAll() {
    this.kpiKindService.getAll().subscribe((res: object) => {
      this.data = res ;
    })
  }

  save() {
    if (this.NameVI == null) {
      this.NameVI = this.NameEn
    }
    const model = {
      NameVI: this.NameVI,
      NameEn: this.NameEn,
      NameTW: this.NameTW,
    }
    this.kpiKindService.Add(model).subscribe(res => {
      if(res) {
        this.alertify.success('Add successfully')
        this.modalReference.close();
        this.getAll();
      }else {
        this.alertify.error('Server Error')
      }
    })
  }

  update() {
    const model = {
      ID: this.ID,
      NameVI: this.NameVIEdit,
      NameEn: this.NameEnEdit,
      NameTW: this.NameTWEdit,
    }
    this.kpiKindService.Update(model).subscribe(res => {
      if(res) {
        this.alertify.success('Update successfully')
        this.getAll()
        this.modalReference.close();
      }else {
        this.alertify.error('Server Error')
      }
    })
  }

  openAddModel(model) {
    this.modalReference = this.modalService.open(model,{ size: 'xl' })
  }

  edit(data, model) {
    this.modalReference = this.modalService.open(model,{ size: 'xl' })
    this.ID = data.ID;
    this.NameTWEdit = data.NameTW
    this.NameEnEdit = data.NameEn
    this.NameVIEdit = data.NameVI
  }

  delete(id) {
    this.alertify.confirm('Delete', "You won't be able to revert this!", () => {
      this.kpiKindService.Delete(id)
      .subscribe((res: any)=>{
        this.alertify.success('KPI Kind has been deleted')
        this.getAll()
      })
    })
  }
}
