import { TestBed } from '@angular/core/testing';

import { AdminOccategoriesService } from './admin-occategories.service';

describe('AdminOccategoriesService', () => {
  let service: AdminOccategoriesService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(AdminOccategoriesService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
