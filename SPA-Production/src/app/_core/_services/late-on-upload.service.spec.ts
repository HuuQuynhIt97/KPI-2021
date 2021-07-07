import { TestBed } from '@angular/core/testing';

import { LateOnUploadService } from './late-on-upload.service';

describe('LateOnUploadService', () => {
  let service: LateOnUploadService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(LateOnUploadService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
