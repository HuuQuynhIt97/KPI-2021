import { TestBed } from '@angular/core/testing';

import { AdminOcService } from './admin-oc.service';

describe('AdminOcService', () => {
  let service: AdminOcService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(AdminOcService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
