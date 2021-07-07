import { TestBed } from '@angular/core/testing';

import { UserlevelService } from './userlevel.service';

describe('UserlevelService', () => {
  let service: UserlevelService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(UserlevelService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
