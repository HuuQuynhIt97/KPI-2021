import { ComponentFixture, TestBed, waitForAsync } from '@angular/core/testing';

import { AdminKPIComponent } from './admin-kpi.component';

describe('AdminKPIComponent', () => {
  let component: AdminKPIComponent;
  let fixture: ComponentFixture<AdminKPIComponent>;

  beforeEach(waitForAsync(() => {
    TestBed.configureTestingModule({
      declarations: [ AdminKPIComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AdminKPIComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
