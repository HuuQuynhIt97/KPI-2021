import { ComponentFixture, TestBed, waitForAsync } from '@angular/core/testing';

import { AdminOCComponent } from './admin-oc.component';

describe('AdminOCComponent', () => {
  let component: AdminOCComponent;
  let fixture: ComponentFixture<AdminOCComponent>;

  beforeEach(waitForAsync(() => {
    TestBed.configureTestingModule({
      declarations: [ AdminOCComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AdminOCComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
