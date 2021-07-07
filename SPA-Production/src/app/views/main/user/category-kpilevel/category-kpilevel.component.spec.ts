import { ComponentFixture, TestBed, waitForAsync } from '@angular/core/testing';

import { CategoryKPILevelComponent } from './category-kpilevel.component';

describe('CategoryKPILevelComponent', () => {
  let component: CategoryKPILevelComponent;
  let fixture: ComponentFixture<CategoryKPILevelComponent>;

  beforeEach(waitForAsync(() => {
    TestBed.configureTestingModule({
      declarations: [ CategoryKPILevelComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CategoryKPILevelComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
