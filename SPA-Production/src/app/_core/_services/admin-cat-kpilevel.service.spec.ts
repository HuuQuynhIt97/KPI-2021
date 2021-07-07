import { TestBed } from '@angular/core/testing';

import { AdminCatKpilevelService } from './admin-cat-kpilevel.service';

describe('AdminCatKpilevelService', () => {
  let service: AdminCatKpilevelService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(AdminCatKpilevelService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
