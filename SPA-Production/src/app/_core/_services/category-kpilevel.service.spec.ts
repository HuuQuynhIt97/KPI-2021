import { TestBed } from '@angular/core/testing';

import { CategoryKpilevelService } from './category-kpilevel.service';

describe('CategoryKpilevelService', () => {
  let service: CategoryKpilevelService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(CategoryKpilevelService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
