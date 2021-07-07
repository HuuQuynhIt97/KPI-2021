import { ComponentFixture, TestBed, waitForAsync } from '@angular/core/testing';

import { CategoryKPILevelAdminComponent } from './category-kpilevel-admin.component';

describe('CategoryKPILevelAdminComponent', () => {
  let component: CategoryKPILevelAdminComponent;
  let fixture: ComponentFixture<CategoryKPILevelAdminComponent>;

  beforeEach(waitForAsync(() => {
    TestBed.configureTestingModule({
      declarations: [ CategoryKPILevelAdminComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CategoryKPILevelAdminComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
