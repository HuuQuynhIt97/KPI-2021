import { ComponentFixture, TestBed, waitForAsync } from '@angular/core/testing';

import { AdminLevelComponent } from './admin-level.component';

describe('AdminLevelComponent', () => {
  let component: AdminLevelComponent;
  let fixture: ComponentFixture<AdminLevelComponent>;

  beforeEach(waitForAsync(() => {
    TestBed.configureTestingModule({
      declarations: [ AdminLevelComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AdminLevelComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
