class User < ApplicationRecord
    def tests_by_level(test_level)
        tests.where(level: test_level)
    end
end
