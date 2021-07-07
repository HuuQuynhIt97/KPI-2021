import { TestBed } from '@angular/core/testing';

import { AdminlevelService } from './adminlevel.service';

describe('AdminlevelService', () => {
  let service: AdminlevelService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(AdminlevelService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
