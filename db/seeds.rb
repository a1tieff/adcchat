
@steps = [
   {
     stage: 1,
     opening: true,
     replicas: [
       {
         position: 0,
         phrase: 'Ghbdtn, rfr ltkf?'
       },
       {
         position: 1,
         phrase: 'Ой'
       },
       {
         position: 2,
         phrase: 'Привет, как дела?'
       },
       {
         position: 3,
         phrase: 'Ладно, знаешь меня?'
       }
     ],
     answers: [
       {
         position: 0,
         phrase: 'Ghbdtn, rfr ltkf?',
         next_stage: 2
       },
       {
         position: 1,
         phrase: 'Ой',
         next_stage: 3
       }
     ]
   },
   {
     stage: 2,
     opening: true,
     replicas: [
       {
         position: 0,
         phrase: 'Ghbdtn, rfr ltkf?'
       },
       {
         position: 1,
         phrase: 'Ой'
       },
       {
         position: 2,
         phrase: 'Привет, как дела?'
       },
       {
         position: 3,
         phrase: 'Ладно, знаешь меня?'
       }
     ],
     answers: [
       {
         position: 0,
         phrase: 'Ghbdtn, rfr ltkf?',
         next_stage: 3
       },
       {
         position: 1,
         phrase: 'Ой',
         next_stage: 4
       }
     ]
   },
   {
     stage: 3,
     opening: true,
     replicas: [
       {
         position: 0,
         phrase: 'Ghbdtn, rfr ltkf?'
       },
       {
         position: 1,
         phrase: 'Ой'
       },
       {
         position: 2,
         phrase: 'Привет, как дела?'
       },
       {
         position: 3,
         phrase: 'Ладно, знаешь меня?'
       }
     ],
     answers: [
       {
         position: 0,
         phrase: 'Ghbdtn, rfr ltkf?',
         next_stage: 2
       },
       {
         position: 1,
         phrase: 'Ой',
         next_stage: 4
       }
     ]
   },
   {
     stage: 4,
     opening: true,
     replicas: [
       {
         position: 0,
         phrase: 'Ghbdtn, rfr ltkf?'
       },
       {
         position: 1,
         phrase: 'Ой'
       },
       {
         position: 2,
         phrase: 'Привет, как дела?'
       },
       {
         position: 3,
         phrase: 'Ладно, знаешь меня?'
       }
     ],
     answers: [
       {
         position: 0,
         phrase: 'Ghbdtn, rfr ltkf?'
       },
       {
         position: 1,
         phrase: 'Ой'
       }
     ]
   }
]
def seed_data
  drop_db
  create_steps
  create_next_steps
  puts @steps
end

def drop_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end

def create_steps
  @steps.each_with_index do |step, index|
    s = Step.create!(opening: step[:opening])
    puts "Step just created with params #{ s.opening }"
    @steps[index][:id] = s.id
    puts @steps[index][:id]

    create_replicas(s, step[:replicas])
    create_answers(index, s, step[:answers])
    #step[:replicas].each do |replica|
    #  # r = Relica.create!(step_id: s.id)
    #  r = s.replicas.create!(replica)
    #  puts "Step just created with params '#{ r.phrase }' for step with id #{ r.step.id }"
    #end
  end
end

def create_replicas(step, replicas)
  replicas.each do |replica|
    r = step.replicas.create!(replica)
    puts "Replica just created with params '#{ r.phrase }' for step with id #{ r.step.id }"
  end
end


def create_answers(index, step, answers)
  answers.each_with_index do |answer, i|
    a = step.answers.create!(position: answer[:position], phrase: answer[:phrase])
    puts "Answer just created with params '#{ a.phrase }' for step with id #{ a.step.id }"

    @steps[index][:answers][i][:id] = a.id
  end
end

def create_next_steps
  @steps.each do |step|
    step[:answers].each do |answer|
      if answer.has_key?(:next_stage)
        @steps.each do |s|
          if s[:stage] == answer[:next_stage]
            ns = NextStep.create!(step_id: s[:id], answer_id: answer[:id])
            puts "NextStep just created for step with id #{ ns.step.id } and answer with id #{ ns.answer.id }"
          end
        end
      end
    end
  end
end

seed_data

# numbers = [0, 1, 2, 3, 4, 5]
#
# def counter (my_cool_number)
#   puts my_cool_number
# end
#
# numbers.each do |number_we_working_on_now|
#   counter(1)
# end
