import { ComponentFixture, TestBed, waitForAsync } from '@angular/core/testing';

import { AdminOCCategoriesComponent } from './admin-occategories.component';

describe('AdminOCCategoriesComponent', () => {
  let component: AdminOCCategoriesComponent;
  let fixture: ComponentFixture<AdminOCCategoriesComponent>;

  beforeEach(waitForAsync(() => {
    TestBed.configureTestingModule({
      declarations: [ AdminOCCategoriesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AdminOCCategoriesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
